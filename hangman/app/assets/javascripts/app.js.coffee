HangMan = angular.module "HangMan", []

HangMan.controller "IndexCtrl", ['$scope', ($scope) ->
	$scope.title = "Gettin Supa Jiggy with HangMan"
	$scope.word = []

	$scope.$watch "typing", ->
		if $scope.typing == "hangman"
			$scope.notice = "You got it mofo!"
			$scope.removed = true
			$scope.submit == ""
			$scope.typing.slice.push() = []


	]

