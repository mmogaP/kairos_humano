import requests
import psycopg2
from datetime import datetime
import logging

# Configurar logging
logging.basicConfig(filename='data_integration.log', level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

def extract_and_save_data():
    try:
        # Obtener datos de la API
        users_response = requests.get('https://jsonplaceholder.typicode.com/users')
        posts_response = requests.get('https://jsonplaceholder.typicode.com/posts')

        users = users_response.json()
        posts = posts_response.json()

        # Conectar a la base de datos
        conn = psycopg2.connect(
            host="db",
            database="jsonplaceholder_db",
            user="user",
            password="password"
        )
        cur = conn.cursor()

        # Insertar usuarios
        for user in users:
            cur.execute("""
                INSERT INTO dim_users (id, name, email)
                VALUES (%s, %s, %s)
                ON CONFLICT (id) DO UPDATE SET
                    name = EXCLUDED.name,
                    email = EXCLUDED.email
            """, (user['id'], user['name'], user['email']))

        # Insertar posts
        for post in posts:
            cur.execute("""
                INSERT INTO fact_posts (id, user_id, title, body)
                VALUES (%s, %s, %s, %s)
                ON CONFLICT (id) DO UPDATE SET
                    user_id = EXCLUDED.user_id,
                    title = EXCLUDED.title,
                    body = EXCLUDED.body
            """, (post['id'], post['userId'], post['title'], post['body']))

        conn.commit()
        logging.info("Datos extraídos y guardados exitosamente")

    except Exception as e:
        logging.error(f"Error durante la extracción y guardado de datos: {str(e)}")
        conn.rollback()

    finally:
        if conn:
            cur.close()
            conn.close()

if __name__ == "__main__":
    extract_and_save_data()