package dev.maes.navigation

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Android
import androidx.compose.material.icons.filled.School
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.vector.ImageVector
import dev.maes.navigation.ui.pages.AndroidScreen
import dev.maes.navigation.ui.pages.CoursesScreen


interface Destination {
    val icon: ImageVector
    val route: String
    val screen: @Composable () -> Unit
}

object Android : Destination {
    override val icon = Icons.Filled.Android
    override val route = "android"
    override val screen: @Composable () -> Unit = { AndroidScreen() }
}

object Courses : Destination {
    override val icon = Icons.Filled.School
    override val route = "courses"
    override val screen: @Composable () -> Unit = { CoursesScreen() }
}

// Screens to be displayed in the top RallyTabRow
val tabRowScreens = listOf(Android, Courses)