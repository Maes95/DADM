package dev.maes.navigation.ui.components

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import dev.maes.navigation.Android
import dev.maes.navigation.Courses
import dev.maes.navigation.ui.pages.AndroidScreen
import dev.maes.navigation.ui.pages.CoursesScreen

@Composable
fun CustomNavHost(
    navController: NavHostController,
    modifier: Modifier = Modifier
) {
    NavHost(
        navController = navController,
        startDestination = Android.route,
        modifier = modifier
    ) {
        composable(route = Android.route) {
            AndroidScreen(
                onSeeCoursesClick={
                    navController.navigateSingleTopTo(Courses.route)
                }
            )
        }
        composable(route = Courses.route) {
            CoursesScreen()
        }
    }
}

fun NavHostController.navigateSingleTopTo(route: String) =
    this.navigate(route) { launchSingleTop = true }