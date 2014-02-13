Template.mangaList.helpers
    manga: () ->
       Manga.find {},
           sort:
               submitted: -1
