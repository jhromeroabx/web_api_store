document.addEventListener("DOMContentLoaded", function () {
  var startButton = document.getElementById("startButton");
  var stopButton = document.getElementById("stopButton");
  var audioElement = document.getElementById("audioElement");
  var counterElement = document.getElementById("counter");
  var textInput = document.getElementById("textInput");
  var submitButton = document.getElementById("submitButton");
  var mediaRecorder;
  var chunks = [];
  var startTime;

  startButton.addEventListener("click", function () {
    chunks = [];
    
    navigator.mediaDevices
      .getUserMedia({ audio: true })
      .then(function (stream) {
        mediaRecorder = new MediaRecorder(stream);
        mediaRecorder.start();

        startButton.disabled = true;
        stopButton.disabled = false;
        startTime = Date.now();
        updateCounter();

        counterElement.classList.add("rainbow");

        mediaRecorder.ondataavailable = function (e) {
          chunks.push(e.data);
        };

        mediaRecorder.onstop = function () {
          var audioBlob = new Blob(chunks, { type: "audio/ogg; codecs=opus" });
          // chunks = [];
          var audioUrl = URL.createObjectURL(audioBlob);
          audioElement.src = audioUrl;
          stopButton.disabled = true;
          startButton.disabled = false;
        };
      })
      .catch(function (err) {
        console.error("Error al acceder al micrófono: ", err);
      });
  });

  stopButton.addEventListener("click", function () {
    mediaRecorder.stop();
    stopCounter();
  });

  function updateCounter() {
    var timer = setInterval(function () {
      var elapsedTime = Math.floor((Date.now() - startTime) / 1000);
      var hours = Math.floor(elapsedTime / 3600);
      var minutes = Math.floor((elapsedTime % 3600) / 60);
      var seconds = elapsedTime % 60;
      counterElement.textContent =
        "Tiempo de grabación: " +
        pad(hours) +
        ":" +
        pad(minutes) +
        ":" +
        pad(seconds);
    }, 1000);
    stopButton.addEventListener("click", function () {
      clearInterval(timer);
    });
  }

  function stopCounter() {
    counterElement.textContent = "Grabación capturada ❤️";
    counterElement.classList.remove("rainbow");
  }

  function pad(num) {
    return (num < 10 ? "0" : "") + num;
  }

  submitButton.addEventListener("click", function () {
    var nombreArchivo = textInput.value.trim();
    textInput.value = "";
    if (!nombreArchivo) {
      alert("Por favor ingresa un nombre para el archivo.");
      return;
    }

    if (!chunks.length) {
      alert("No se ha grabado ningún audio.");
      return;
    }

    var audioBlob = new Blob(chunks, { type: "audio/mpeg" });
    var formData = new FormData();
    formData.append("archivo", audioBlob);

    fetch(
      "https://miniowebapi-dev.abexa.pe/api/Archivo/subirArchivoMp3?name=" +
        encodeURIComponent(nombreArchivo),
      {
        method: "POST",
        body: formData,
        headers: {
          accept: "text/plain",
        },
      }
    )
      .then(function (response) {
        if (!response.ok) {
          throw new Error("Error al enviar el archivo.");
        }
        alert("El archivo se ha enviado correctamente.");
        chunks = [];
      })
      .catch(function (error) {
        console.error("Error: ", error);
        alert("Ha ocurrido un error al enviar el archivo.");
      });
  });
});
