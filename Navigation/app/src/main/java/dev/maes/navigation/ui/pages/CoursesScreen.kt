package dev.maes.navigation.ui.pages

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import dev.maes.navigation.ui.components.CardInfo
import dev.maes.navigation.ui.components.CustomCardList

@Composable
fun CoursesScreen() {
    Column(
        modifier = Modifier
            .padding(16.dp)
    ) {
        CustomCardList(getCardList())
    }
}

private fun getCardList() = listOf(
    CardInfo("Aspectos básicos de Jetpack Compose", "Obtén experiencia práctica y aprende los aspectos básicos de la IU declarativa, el trabajo con el estado, los diseños y los temas. Verás qué son los elementos que admiten composición y los modificadores, cómo trabajar con elementos básicos de la IU como Row y Column, y cómo darle estado a tu app."),
    CardInfo("Diseños básicos en Compose", "Obtén información sobre cómo funcionan los diseños en Jetpack Compose, lo que incluye los diseños integrados, los modificadores y cómo compilar tu propio diseño personalizado."),
    CardInfo("Estado en Jetpack Compose","Obtén información sobre los conceptos básicos relacionados con el uso del estado en Jetpack Compose a fin de compilar apps interactivas y enriquecidas para Android"),
    CardInfo("Navigation de Jetpack Compose","Aprende a usar la biblioteca de Jetpack Navigation en Compose, navegar dentro de tu aplicación, navegar con argumentos, admitir vínculos directos y probar tu navegación.")
)
