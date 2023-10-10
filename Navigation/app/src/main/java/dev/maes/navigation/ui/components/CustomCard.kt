package dev.maes.navigation.ui.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Card
import androidx.compose.material3.Divider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

data class CardInfo(val title:String, val text:String)

@Composable
fun CustomCard(title:String, text:String){
    Card() {
        Column {
            CardHeader(title)
            CardContent(text)
        }
    }
    Divider(color = MaterialTheme.colorScheme.background, thickness = 10.dp)
}

@Composable
fun CustomCardList(cards:List<CardInfo>){
    LazyColumn() {
        items(cards) { card ->
            CustomCard(title = card.title, text = card.text)
        }
    }
}

@Composable
fun CardHeader(headerText: String) {
    Row(
        modifier = Modifier
            .padding(12.dp)
            .fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = headerText,
            style = MaterialTheme.typography.titleMedium,
            modifier = Modifier.align(Alignment.CenterVertically)
        )
    }
}

@Composable
fun CardContent(contentText: String){
    Row(
        modifier = Modifier
            .padding(12.dp)
            .fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(text = contentText)
    }
}