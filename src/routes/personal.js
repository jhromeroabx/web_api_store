const express = require("express");
const path = require('path');

const router = express.Router();

router.get("/main", (_req, res) => {
    res.json({ Jhosep_Adbel_Romero_Loa: "¿Karen Andrea Torres Colan, Te gustaria ser mi novia o mejor aun casarte conmigo?", });
});

router.get("/first", (_req, res) => {
    res.json({
        primero: "perdon por lo que dije, si fue fuerte creo, :,c",
        segundo: "gracias karen por conocerte, la verdad el Practigest me hizo valorarme como persona y profesional, eso es algo que nunca podre pagartelo, no sabes todo el dolor que sentia pero bueno ... eso es otra historia",
        tercero: "te puedo devolver el favor aunque sea pagandote el 0.5% ayudante con tu tesis que estoy seguro que no has avanzado mucho, totalmente gratis :)",
        cuarto: "¿te gustaria ser mi amiga especial Karen Andrea Torres Colan?",
        cuarto_5: "TRUE = Si || FALSE = No"
    });
});

router.get("/perfection-found", (_req, res) => {
    const poemaData = {
        Jhosep_Adbel_Romero_Loa: "LA PERFECCIÓN ENCONTRADA by JARL with so much love ❤️❤️",
        date: "19-01-2024",
        body:
            `Oh mi hermosa princesa de fuego color canela,\n
            eres mi Karen Andrea Torres Colan️❤️❤️❤️, la mujer mas bella,\n
            desde que llegaste a mi vida,\n
            le diste color y sentido a todos mis dias,\n
            desde que te conoci y vi el esfuerzo que haces dia a dia,\n
            me maraville de tu coraje, disciplina y valentia,\n
            Y un día como hoy, el 19 de diciembre del 2023, cuando aceptaste ser mi novia,\n
            Supe que amaría estar a tu lado todos los días de mi vida,\n
            Soy un hombre muy feliz desde que te conocí,\n
            Ahora que estamos juntos aun más, desde la primera vez que te vi.\n
            Disfruto cada momento que estoy a tu lado en verdad,\n
            Me llena de amor y felicidad mi corazón con toda tu divinidad.\n
            Cuando te veo, amo tu rostro, tu sonrisa, tus mejillas, tu perfecta nariz,\n
            Tu bella y esbelta figura, tu hermosa piel, tu lindo cabello, cuando estoy a tu lado soy muy feliz como una ave perdiz,\n
            Cuando viajamos de lima a huaral, amo abrazar tus fríos brazos,\n
            Se calienta mi corazón y todo mi ser al estar a tu lado como fuertes lazos,\n
            Te prometo estar a tu lado toda mi vida hasta que mi muerte lo permita,\n
            Nunca dejaré de amarte y darte todo lo que tu corazón necesita.\n
            No importa al lugar a donde vayas,\n
            Moveré cielo y tierra para buscarte y estar a tu lado donde te hallas,\n
            Eres perfecta tal como eres, graciosa, divertida, seria, trabajadora y responsable,\n
            Me encantas y enamoraste demasiado con tu actitud formidable,\n
            Te juro por mi vida que siempre haré hasta lo imposible para superar los obstáculos,\n
            Espero acertar en todo y ser un adivino como un oráculo.\n
            Con el poquito tiempo que estoy a tu lado, me importas mucho en verdad,\n
            Me preocupas demasiado cuando a mi lado no estas,\n
            Oro todos los días por ti y tu bienestar,\n
            que todas tu metas logres conquistar,\n
            Eres la única mujer que cambio mi vida como un giro de 360 grados,\n
            vales mucho para mi y te seguiré siempre a todos lados.\n
            Antes de conocerte mi vida era gris y sin color,\n
            sin esperanzas de seguir en este mundo por todo el dolor.\n
            Ahora que te tengo a mi lado te quiero cuidar y proteger de todo,\n
            daré mi vida para cumplirlo y es lo que más valoro,\n
            No sabes cuanto te amo mi hermosa, inteligente y apasionada Karen Andrea Torres Colan,\n
            espero guardes bajo 7 llaves mi corazón que te dan, ya que es solo tuyo y de nadie más,\n
            Feliz primer mes juntos y que esta bella historia se siga escribiendo en una gran biblioteca por que habrán muchas hojas, libros y volúmenes, yo me encargaré de ello mi hermosa deidad.\n
            Con toda mi amor❤️💕😍😘💖🥰❣💕💞💓💗💝💘💟💌, alma, cuerpo y espíritu para mi amada, bella, esbelta e inteligente Karen Andrea Torres Colan de tu amado Jhosep Adbel Romero Loa. - 19.01.2024\n`
    };

    // poemaData.body = poemaData.body.replace('/\n/g', '<br>');
  poemaData.body = poemaData.body.replace(/\n/g, '<br>');

    // res.send(html);
    res.render(path.join(__dirname, 'perfection-found/view/index.ejs'), { poemaData: poemaData });

})

router.get("/confirmation", (_req, res) => {
    const poemaData = {
        Jhosep_Adbel_Romero_Loa: "LA CONFIRMACIÓN by JARL with ❤️",
        date: "24-12-2023",
        body:
            `Oh mi bella deidad, eres tan hermosa,\n
Es por eso que eres mi diosa.\n
No sabes cuánto te amo,\n
ya que por ti todo lo hago.\n
Desde la primera vez que te vi,\n
Mi corazón se flecho y por ti me perdí.\n
Desde que te conocí,\n
admire la forma de ser de ti,\n
y cuando aceptaste ser mi novia,\n
supe que no podía perder la oportunidad que me das, ya que no llovía.\n
Eres una fascinante dama,\n
al cuál mi corazón ama,\n
cómo a ningún ser en el faz de la Tierra,\n
antes de conocerte mi vida era áspera como una sierra.\n
Perdón por haberme comportado de horrible forma, muy desagradable,\n
eso no es correcto y tampoco dable.\n
Eres perfecta, nunca cambies,\n
Ya que me enamoré de tu cabeza a los pies.\n
A veces me comporto como un burro, ogro, desconsiderado y patán,\n
te pido que me perdones a este humilde corazón que te dan,\n
ya que tú eres la mujer que siempre soñé,\n
eres la madre de mis hijos que siempre añoré.\n
Si pudiera despertar a tu lado todos los días,\n
sería un logro de vida que me permitirías,\n
ya que no tenía rumbo antes de conocerte,\n
ahora que te conozco, te prefiero como esposa tenerte.\n
Amo tu forma de ser, eres maravillosa,\n
es por eso que siempre serás mi diosa que me saco de las horribles fosas.\n
Te amo mucho Karen Andrea Torres Colan,\n
te quiero proteger de este mundo cruel en dónde estás.\n
Permíteme ser tu pareja por el resto de mi vida mi amor,\n
te prometo que no te arrepentirás mi bella flor,\n
no te defraudare ni te traicionare.\n
Eres la más hermosa casualidad que la vida me puedo ofrecer.\n
te amo mucho mi niña hermosa, mi deidad, mi amorcito bella y esbelta.\n
Gracias por haberme leído, te amo mucho, nunca lo olvides.\n
De JARL con ❤️💕 para Karen Andrea Torres Colan (mi hermosa deidad) – 24/12/2023.\n`
    };

    const html = `
    <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poema de JARL #2</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #f8f8f8;
            overflow: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: 50px 50px;
            background-image: linear-gradient(45deg, #ff5555 25%, transparent 25%, transparent 75%, #ff5555 75%, #ff5555), linear-gradient(45deg, #ff5555 25%, white 25%, white 75%, #ff5555 75%, #ff5555);
        }

        .poema-container {
            max-width: 600px;
            max-height: 400px;
            overflow-y: auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        h1 {
            color: #4285f4;
        }

        p {
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .autor {
            font-style: italic;
            color: #666;
        }
    </style>
</head>
<body>

<div class="poema-container">
    <h1>${poemaData.Jhosep_Adbel_Romero_Loa}</h1>
    <p>${poemaData.body.replace(/\n/g, '<br>')}</p>
    <p class="autor">— by JARL with ❤️😘😍💕 —</p>
</div>

</body>
</html>
    `;

    res.send(html);
})

router.get("/JARLandKATC", (_req, res) => {
    const poemaData = {
        Jhosep_Adbel_Romero_Loa: "NUESTRA ODISEA by JARL with ❤️",
        date: "28-11-2023",
        body:
            `Era un día soleado,\n
estaba triste y mareado,\n
angustiado por haber pedido todo,\n
pues estaba metido en la soledad ni modo.\n
Luego llegaste a mi vida como un ángel inocente\n
Estaba deprimido y no quería seguir de frente.\n
Me levantaste la moral profesional,\n
y también personal.\n
Eso es invaluable\n
y loable.\n
Habla muy bien de tu persona y ser\n
eres alguien al cual yo me quiero parecer.\n
Luego aprendí que no estaba solo tenía tu valiosa amistad,\n
la cual valoro como un diamante en verdad.\n
Te contaba todo con soltura,\n
Y tú siempre estabas a la altura.\n
Me soportaste en mi peor faceta,\n
Y luego me quite la careta,\n
debido a la belleza de tu ser interior.\n
Claro eres bella por dentro y fuera,\n
no eres igual a nadie y ni a cualquiera.\n
Luego sentí que quería y debía estar contigo\n
Ya que nadie me entendía más que tú, ni mi amigo.\n
Quiero que estés a mi lado para toda la vida,\n
no solo una salida.\n
Lo que he hecho y contado,\n
con nadie más lo he experimentado.\n
Deseo que seas la madre de mis hijos,\n
darte mi mundo y por ti me corrijo.\n
Deseo casarme contigo y vivir contigo una eternidad,\n
eres mi gran amor y mi deidad.\n
Te amo mucho Karen Andrea Torres Colan,\n
Espero que no rechaces el corazón que te dan,\n
Ya que es mío y ahora tuyo y de nadie más.\n
Gracias por haberme escuchado y\n
Haberme soportado.\n
Con ❤️ por Jhosep Adbel Romero Loa 28.11.2023
` };

    const html = `
        <!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Poema de JARL</title>
        </head>
        <body>
            <div id="poem-container">
                <h1>${poemaData.Jhosep_Adbel_Romero_Loa}</h1>
                <pre>${poemaData.body}</pre>
            </div>
        </body>
        </html>
    `;

    res.send(html);


});

//   res.json({
//     Jhosep_Adbel_Romero_Loa: "¿Karen Andrea Torres Colan, Te gustaria ser mi mejor amiga para toda la vida?",
//   });

module.exports = router;
