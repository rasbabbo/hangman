HangMan = angular.module "HangMan", []

HangMan.controller "IndexCtrl", ['$scope', ($scope) ->
	$scope.title = "Gettin Supa Jiggy with HangMan"


	$scope.$watch "word", ->
		if $scope.typing == "hangman"
			$scope.notice = "You got it mofo!"
			$scope.removed = true
			$scope.submit == ""


	$scope.submit = ->
		$scope.answer = []
		$scope.word.slice.push(answer)
	]

