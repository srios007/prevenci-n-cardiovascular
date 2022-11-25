import 'package:flutter/widgets.dart';
import 'package:prevencion_cardiovascular/app/utils/palette.dart';

class Labels {
  var lightStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Palette.darkBlue,
  );
  var boldStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Palette.darkBlue,
  );

  Widget first() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 0, 36, 22),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text:
              'Aquí tendrás una experiencia completa y además de mucha información ',
          style: lightStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'que te ayudará ',
              style: boldStyle,
            ),
            TextSpan(
              text: 'a prevenir enfermedades en el futuro',
              style: lightStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget second() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 0, 36, 22),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'En PrevenApp puedes tener todo ',
          style: lightStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'al alcance de tu mano, tenemos ',
              style: boldStyle,
            ),
            TextSpan(
              text: 'información importante para ti.',
              style: lightStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget third() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 0, 36, 22),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Puedes solicitar información ',
          style: lightStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'desde la comodiad de tu casa ',
              style: boldStyle,
            ),
            TextSpan(
              text: 'con la mejor atención que nuestro equipo te puede dar.',
              style: lightStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget fourth() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 0, 36, 22),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Tienes una ',
          style: lightStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'solución digital ',
              style: boldStyle,
            ),
            TextSpan(
              text: ' al alcance de tu mano y sin ningún tipo de suscripción',
              style: lightStyle,
            ),
          ],
        ),
      ),
    );
  }
}

Labels labels = Labels();
