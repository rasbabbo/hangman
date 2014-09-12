HangMan = angular.module "HangMan", []

HangMan.controller "IndexCtrl", ['$scope', (scope) ->
	$scope.title = "Gettin Supa Jiggy with HangMan"

	$scope.word = {}

	$scope.hang = []

	Hang.filter 'gameLogic', ->
		(word) ->
			word.split("") << hang


	]

