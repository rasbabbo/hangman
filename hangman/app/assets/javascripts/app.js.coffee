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

	$scope.alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
	$scope.guesses = []
	$scope.hiddenWords = []
	$scope.button = true

	$scope.initialize = ->
		$scope.guessChars = []
		$scope.guessCount = 0


	$scope.addWord = ->
		$scope.currentWord = $scope.newWord
		$scope.newWord = ""
		$scope.initialize()



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

