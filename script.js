document.addEventListener("DOMContentLoaded", function () {
    const books = [
        {
            title: "Cien Años de Soledad",
            description: "Una obra maestra de Gabriel García Márquez sobre la historia de la familia Buendía en el pueblo ficticio de Macondo.",
            image: "https://example.com/cien-anos-de-soledad.jpg"  // URL de una imagen del libro
        },
        {
            title: "Harry Potter y la Piedra Filosofal",
            description: "El inicio de la saga de Harry Potter, donde conocemos al joven mago y sus aventuras en Hogwarts.",
            image: "https://example.com/harry-potter.jpg"  // URL de una imagen del libro
        },
        {
            title: "El Resplandor",
            description: "Una aterradora novela de Stephen King sobre los eventos sobrenaturales en un hotel aislado.",
            image: "https://example.com/el-resplandor.jpg"  // URL de una imagen del libro
        },
        {
            title: "La Casa de los Espíritus",
            description: "Una novela de Isabel Allende que mezcla la realidad con lo sobrenatural en la historia de la familia Trueba.",
            image: "https://example.com/la-casa-de-los-espiritus.jpg"  // URL de una imagen del libro
        },
        {
            title: "El Señor de los Anillos",
            description: "La épica fantasía de J.R.R. Tolkien sobre la lucha entre el bien y el mal en la Tierra Media.",
            image: "https://example.com/el-senor-de-los-anillos.jpg"  // URL de una imagen del libro
        }
    ];

    const bookSelect = document.getElementById("book-select");
    const bookDescription = document.getElementById("book-description");
    const bookImage = document.getElementById("book-image");
    const bookTitle = document.getElementById("book-title");

    // Cargar los libros en el select
    books.forEach((book, index) => {
        const option = document.createElement("option");
        option.value = index;
        option.textContent = book.title;
        bookSelect.appendChild(option);
    });

    // Mostrar detalles del libro seleccionado
    bookSelect.addEventListener("change", function () {
        const selectedBook = books[this.value];
        bookTitle.textContent = selectedBook.title;
        bookDescription.textContent = selectedBook.description;
        bookImage.src = selectedBook.image;
        bookImage.classList.remove("hidden");
    });
});
