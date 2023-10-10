package dev.maes.navigation

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Android
import androidx.compose.material.icons.filled.School
import androidx.compose.ui.graphics.vector.ImageVector


interface Destination {
    val icon: ImageVector
    val route: String
}

object Android : Destination {
    override val icon = Icons.Filled.Android
    override val route = "android"
}

object Courses : Destination {
    override val icon = Icons.Filled.School
    override val route = "courses"
}

// Screens to be displayed in the top RallyTabRow
val rallyTabRowScreens = listOf(Android, Courses)