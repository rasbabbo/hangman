HangMan = angular.module "HangMan", [ "ngRoute", "templates"]


#initialize the router: 

HangMan.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when "/",
			templateUrl: "index.html",
			controller: "IndexCtrl"
	.otherwise
		redirectTo: "/"

		$locationProvider.html5Mode(true).hashPrefix("#")
]


#create controller

HangMan.controller "IndexCtrl", ['$scope', ($scope) ->

	$scope.addWord = ->

		$scope.button = true
		$scope.newGame = true

		$scope.letters = "abcdefghijklmnopqrstuvwxyz".split("")

		$scope.submitted = true

		#guess features
		$scope.guesses = []
		$scope.counter = true
		$scope.count = 0
		$scope.max = 6

		#word features
		$scope.word = ""
		$scope.formattedWord = word.toLowerCase()
		$scope.wordArray = formattedWord.split("")

		#set empty fields
		$scope.field = []

		a = 0

		while a < $scope.wordArray.length
			$scope.spaces.push("")
			a += 1

		$scope.hangman = {}

	$scope.guess = (letter) ->

		this.clicked = true

		correct = false

		i = 0
		while i < $scope.wordArray.length
			if $scope.wordArray[i] is letter
				$scope.guesses[i] = letter
				correct = true


		emptyCheck = false
		j=0
		while j < $scope.guesses.length
			if $scope.guesses[j] == undefined
				emptyCheck = true
			j += 1

		if $scope.guesses.length == $scope.wordArray.length && emptyCheck == false
			$scope.letters = []
			$scope.counter = false
			$scope.winMsg = true
			$scope.restart = true

		else if i == $scope.wordArray.length - 1 && correct == false
			$scope.count += 1
			$scope.hangman[$scope.count] = true

			if $scope.count == 6
				$scope.letters = []
				$scope.counter = false
				$scope.loseMsg = true
				$scope.restart = true
			i += 1

		$scope.newGame = ->
			$scope.newMsg = true
			$scope.submitted = false
			$scope.winMsg = false
			$scope.loseMsg = false
			$scope.restart = false

			$scope.guesses = []
			$scope.fields = []
			$scope.hangman = {}

		]















	# $scope.addWord = (word) ->
	# 	$scope.word = word.hiddenWord.split("")
	# 	console.log("word,", $scope.word)
	# 	$scope.wordSaved = true

	# 	i = 0
	# 	while i < $scope.word.length
	# 		newChar = {}
	# 		char = $scope.word[i]
	# 		newChar.ind


	# $scope.getGuess = (guess) ->
	# 	console.log(guess)
	# 	$scope.guesses.push(guess)
	# 	console.log($scope.guesses)
	# 	this.showGuess = true



	# $scope.checkGuess = ->
	# 	if $scope.guessedChars.indexOf($scope.guess) == -1
	# 		$scope.guessedChars.push($scope.guess)
	# 	$scope.guessCount++
	# 	$scope.guess = ""


	# $scope.displayChars = ->
	# 	chars = $scope.currentWord.split("")
	# 	_.each "chars", [ (val, index) ->
	# 		if $scope.guessedChars.indexOf(val) == -1
	# 			chars[index] = "_"
	# 		]
	# ]

HangMan.config ["$httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]