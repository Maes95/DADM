package dev.maes.navigation.ui.pages

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import dev.maes.navigation.ui.components.CardInfo
import dev.maes.navigation.ui.components.CustomCardList


@Composable
fun AndroidScreen(
    onSeeCoursesClick: () -> Unit = {}
) {
    Column(
        modifier = Modifier
            .padding(16.dp)
    ) {
        CustomCardList(getCardList())
        Button(onClick = { onSeeCoursesClick() }) {
            Text("Ver cursos")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun AndroidScreen_preview(){
    AndroidScreen()
}

private fun getCardList() = listOf(CardInfo("Android", android), CardInfo("JetpackCompose", jetpack))

private val android:String = "Android es un sistema operativo móvil basado en el núcleo Linux y otros software de código abierto. Fue diseñado para dispositivos móviles con pantalla táctil, como teléfonos inteligentes, tabletas, relojes inteligentes Wear OS, automóviles con otros sistemas a través de Android Auto, al igual los automóviles con el sistema Android Automotive y televisores Android TV."
private val jetpack:String = "Jetpack Compose es el kit de herramientas moderno de Android para compilar IU nativas. Simplifica y acelera el desarrollo de la IU en Android. Haz que tu app cobre vida rápidamente con menos código, herramientas potentes y APIs intuitivas de Kotlin."