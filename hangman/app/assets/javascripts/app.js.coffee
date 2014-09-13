HangMan = angular.module "HangMan", []

HangMan.controller "IndexCtrl", ['$scope', ($scope) ->
	$scope.currentWord = {}

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

