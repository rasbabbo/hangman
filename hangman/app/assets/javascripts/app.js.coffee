HangMan = angular.module "HangMan", [ "ngRoute", "templates"]


#initialize the router: 

HangMan.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when "/",
			templateUrl: "index.html",
			controller: "IndexCtrl"
	.otherwise
		redirectTo: "/"
]


#create controller

HangMan.controller "IndexCtrl", ['$scope', ($scope) ->

	$scope.alphabets = "abcdefghijklmnopqrstuvwxyz".split("")
	$scope.guesses = []
	$scope.word = []
	$scope.hiddenWord = []
	$scope.wordSaved = false
	$scope.button = true
	$scope.counter = 0
	$scope.max = 6



	$scope.addWord = (word) ->
		$scope.word = word.hiddenWord.split("")
		console.log("word,", $scope.word)
		$scope.wordSaved = true

		i = 0
		while i < $scope.word.length
			newChar = {}
			char = $scope.word[i]
			newChar.ind


	$scope.getGuess = (guess) ->
		console.log(guess)
		$scope.guesses.push(guess)
		console.log($scope.guesses)
		this.showGuess = true



	$scope.checkGuess = ->
		if $scope.guessedChars.indexOf($scope.guess) == -1
			$scope.guessedChars.push($scope.guess)
		$scope.guessCount++
		$scope.guess = ""


	$scope.displayChars = ->
		chars = $scope.currentWord.split("")
		_.each "chars", [ (val, index) ->
			if $scope.guessedChars.indexOf(val) == -1
				chars[index] = "_"
			]
	]

HangMan.config ["$httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]