$response = Invoke-WebRequest -Uri "https://api.chucknorris.io/jokes/random "
$Joke = $response.Content | ConvertFrom-Json
$Joke.value