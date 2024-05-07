const express = require("express");
const path = require("path");

const router = express.Router();

router.get("/main", (_req, res) => {
  res.json({
    Jhosep_Adbel_Romero_Loa:
      "¿Karen Andrea Torres Colan, Te gustaria ser mi novia o mejor aun casarte conmigo?",
  });
});

router.get("/first", (_req, res) => {
  res.json({
    primero: "perdon por lo que dije, si fue fuerte creo, :,c",
    segundo:
      "gracias karen por conocerte, la verdad el Practigest me hizo valorarme como persona y profesional, eso es algo que nunca podre pagartelo, no sabes todo el dolor que sentia pero bueno ... eso es otra historia",
    tercero:
      "te puedo devolver el favor aunque sea pagandote el 0.5% ayudante con tu tesis que estoy seguro que no has avanzado mucho, totalmente gratis :)",
    cuarto: "¿te gustaria ser mi amiga especial Karen Andrea Torres Colan?",
    cuarto_5: "TRUE = Si || FALSE = No",
  });
});

router.get("/with-you", (_req, res) => {
  const poemaData = {
    Jhosep_Adbel_Romero_Loa: "A TU LADO ❤️",
    date: "19-04-2024",
    body: `
    <div class="heart-frame">
    <h3>A TU LADO</h3>
    <button class="japanese-line" onclick="getVoice(this,'01')">❤️👂▶️<p>あなたの側で</p></button>
    <p>01. Anata no soba de</p>
    </div>
    <div class="heart-frame">
    <p>Mi bella musa Karen amada mia,</p>
    <button class="japanese-line" onclick="getVoice(this,'02')">❤️👂▶️<p>私の美しいミューズ、❤️カレン、❤️ 私の最愛の人、</p></button>
    <p>02. Watashi no utsukushī myūzu, Karen, watashi no saiai no hito,</p>
    </div>
    <div class="heart-frame">
    <p>te amo tanto que no tienes idea.</p>
    <button class="japanese-line" onclick="getVoice(this,'03')">❤️👂▶️<p>私はあなたをとても愛しています。</p></button>
    <p>03. Watashi wa anata o totemo aishiteimasu.</p>
    </div>
    <div class="heart-frame">
    <p>Tus ojos son como estrellas.</p>
    <button class="japanese-line" onclick="getVoice(this,'04')">❤️👂▶️<p>あなたの目は星のようです。</p></button>
    <p>04. Anata no me wa hoshi no yōdesu.</p>
    </div>
    <div class="heart-frame">
    <p>tus mejillas rosadas,</p>
    <button class="japanese-line" onclick="getVoice(this,'05')">❤️👂▶️<p>あなたのバラ色の頬、</p></button>
    <p>05. Anata no bara-iro no hoho,</p>
    </div>
    <div class="heart-frame">
    <p>eres bonita como una hada.</p>
    <button class="japanese-line" onclick="getVoice(this,'06')">❤️👂▶️<p>あなたは妖精のようにかわいいです。</p></button>
    <p>06. Anata wa yōsei no yō ni kawaīdesu.</p>
    </div>
    <div class="heart-frame">
    <p>Cada vez que estoy a tu lado,</p>
    <button class="japanese-line" onclick="getVoice(this,'07')">❤️👂▶️<p>私があなたのそばにいるたびに、</p></button>
    <p>07. Watashi ga anata no soba ni iru tabi ni,</p>
    </div>
    <div class="heart-frame">
    <p>Me siento muy inspirado y motivado, </p>
    <button class="japanese-line" onclick="getVoice(this,'08')">❤️👂▶️<p>とても刺激を受けて、モチベーションも上がっていると感じますので、</p></button>
    <p>08. Totemo shigeki o ukete, mochibēshon mo agatte iru to kanjimasunode,</p>
    </div>
    <div class="heart-frame">
    <p>es que estoy enamorado.</p>
    <button class="japanese-line" onclick="getVoice(this,'09')">❤️👂▶️<p>それは私が恋をしているということです。</p></button>
    <p>09. Sore wa watashi ga koiwoshiteiru to iu kotodesu.</p>
    </div>
    <div class="heart-frame">
    <p>Amo cada detalle de ti,</p>
    <button class="japanese-line" onclick="getVoice(this,'10')">❤️👂▶️<p>私はあなたのあらゆる細部を愛しています、</p></button>
    <p>10. Watashi wa anata no arayuru saibu o aishiteimasu,</p>
    </div>
    <div class="heart-frame">
    <p>me gusta tu corazón feliz.</p>
    <button class="japanese-line" onclick="getVoice(this,'11')">❤️👂▶️<p>あなたの幸せな心が好きです。</p></button>
    <p>11. Anata no shiawasena kokoro ga sukidesu.</p>
    </div>
    <div class="heart-frame">
    <p>Contigo me siento muy feliz,</p>
    <button class="japanese-line" onclick="getVoice(this,'12')">❤️👂▶️<p>あなたと一緒にいると私はとても幸せに感じます、</p></button>
    <p>12. Anata to issho ni iru to watashi wa totemo shiawase ni kanjimasu,</p>
    </div>
    <div class="heart-frame">
    <p>quiero tener ese sentimiento sin fin.</p>
    <button class="japanese-line" onclick="getVoice(this,'13')">❤️👂▶️<p>その終わりのない感覚を味わいたい。</p></button>
    <p>13. Sono owari no nai kankaku o ajiwaitai.</p>
    </div>
    <div class="heart-frame">
    <p>Por eso te pido que caminemos juntos siempre,</p>
    <button class="japanese-line" onclick="getVoice(this,'14')">❤️👂▶️<p>だから、いつも一緒に歩いてください。</p></button>
    <p>14. Dakara, itsumoissho ni aruite kudasai.</p>
    </div>
    <div class="heart-frame">
    <p>contigo quiero viajar por todos los continentes.</p>
    <button class="japanese-line" onclick="getVoice(this,'15')">❤️👂▶️<p>あなたと一緒にすべての大陸を旅したいです。</p></button>
    <p>15. Anata to issho ni subete no tairiku o tabi shitaidesu.</p>
    </div>
    <div class="heart-frame">
    <p>Quiero darte todo lo mejor de mi,</p>
    <button class="japanese-line" onclick="getVoice(this,'16')">❤️👂▶️<p>私の全力を尽くしたいと思います、</p></button>
    <p>16. Watashi no zenryoku o tsukushitai to omoimasu,</p>
    </div>
    <div class="heart-frame">
    <p>tener una familia y que mis hijos se parezcan a ti.</p>
    <button class="japanese-line" onclick="getVoice(this,'17')">❤️👂▶️<p>家族がいて、私の子供たちはあなたに似ています。</p></button>
    <p>17. Kazoku ga ite, watashi no kodomo-tachi wa anata ni nite imasu.</p>
    </div>
    <div class="heart-frame">
    <p>Te amo mucho mi bella princesa Karen Andrea Torres Colan, </p>
    <button class="japanese-line" onclick="getVoice(this,'18')">❤️👂▶️<p>私はあなたをとても愛しています、私の美しいプリンセス、❤️カレン・アンドレア・トーレス・コラン、❤️</p></button>
    <p>18. Watashi wa anata o totemo aishiteimasu, watashi no utsukushī purinsesu, Karen andorea tōresu koran,</p>
    </div>
    <div class="heart-frame">
    <p>Un poema de tu caballero de jengibre Jhosep Adbel Romero Loa ❤️💕😍😘💖🥰❣💕💞💓💗💝💘💟💌</p>
    <button class="japanese-line" onclick="getVoice(this,'19')">❤️👂▶️<p>ジンジャーブレッドの騎士からの詩。❤️ジョセップ・アドベル・ロメロ・ロア❤️</p></button>    
    <p>19. Jinjābureddo no kishi kara no uta. Joseppu adoberu romero roa</p>
    </div>
    `,
  };

  res.render(path.join(__dirname, "with-you/view/index.ejs"), {
    poemaData: poemaData,
  });
});

router.get("/make", (_req, res) => {
  const poemaData = {
    Jhosep_Adbel_Romero_Loa: "HAGAMOS ESTO JUNTOS ❤️",
    date: "19-04-2024",
  };

  res.render(path.join(__dirname, "make/view/index.ejs"), {
    poemaData: poemaData,
  });
});

router.get("/perfection-found", (_req, res) => {
  const poemaData = {
    Jhosep_Adbel_Romero_Loa:
      "LA PERFECCIÓN ENCONTRADA by JARL with so much love ❤️❤️",
    date: "19-01-2024",
    body: `Oh mi hermosa princesa de fuego color canela,\n
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
            Con toda mi amor❤️💕😍😘💖🥰❣💕💞💓💗💝💘💟💌, alma, cuerpo y espíritu para mi amada, bella, esbelta e inteligente Karen Andrea Torres Colan de tu amado Jhosep Adbel Romero Loa. - 19.01.2024\n`,
  };

  // poemaData.body = poemaData.body.replace('/\n/g', '<br>');
  poemaData.body = poemaData.body.replace(/\n/g, "<br>");

  // res.send(html);
  res.render(path.join(__dirname, "perfection-found/view/index.ejs"), {
    poemaData: poemaData,
  });
});

router.get("/confirmation", (_req, res) => {
  const poemaData = {
    Jhosep_Adbel_Romero_Loa: "LA CONFIRMACIÓN by JARL with ❤️",
    date: "24-12-2023",
    body: `Oh mi bella deidad, eres tan hermosa,\n
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
De JARL con ❤️💕 para Karen Andrea Torres Colan (mi hermosa deidad) – 24/12/2023.\n`,
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
    <p>${poemaData.body.replace(/\n/g, "<br>")}</p>
    <p class="autor">— by JARL with ❤️😘😍💕 —</p>
</div>

</body>
</html>
    `;

  res.send(html);
});

router.get("/JARLandKATC", (_req, res) => {
  const poemaData = {
    Jhosep_Adbel_Romero_Loa: "NUESTRA ODISEA by JARL with ❤️",
    date: "28-11-2023",
    body: `Era un día soleado,\n
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
`,
  };

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
