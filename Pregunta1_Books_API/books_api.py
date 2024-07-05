import requests
import csv

##en este caso no encontre una API de libros, por lo que utilice la API de JSONPlaceholder que tiene posts en lugar de libros.

# URL de la API de JSONPlaceholder
url = "https://jsonplaceholder.typicode.com/posts"

# Realizar la solicitud a la API
response = requests.get(url)
data = response.json()

# Obtener el total de "libros" (posts en este caso)
total_books = len(data)
print(f"Total de libros encontrados: {total_books}")

# Guardar los datos en un archivo CSV
with open('books.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'Título', 'Contenido'])

    for book in data:
        id = book['id']
        title = book['title']
        body = book['body'].replace('\n', ' ')  # Eliminar saltos de línea en el contenido

        writer.writerow([id, title, body])

print("Los datos se han guardado en 'books.csv'")