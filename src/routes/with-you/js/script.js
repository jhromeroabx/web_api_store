let audio;

function getVoice(element, name) {
  var japaneseText = element.previousSibling.textContent.trim();

  
  if (audio && !audio.paused) {
    audio.pause();
  }

  fetch(
    "https://miniowebapi-dev.abexa.pe/api/Archivo/getMp3?name=" +
      encodeURIComponent(name)
  )
    .then((response) => {
      if (!response.ok) {
        throw new Error("Error al obtener el archivo de audio.");
      }

      return response.blob();
    })
    .then((blob) => {
      const audioUrl = URL.createObjectURL(blob);

      audio = new Audio(audioUrl); // Guardamos el objeto Audio en la variable global

      audio.play();
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}
