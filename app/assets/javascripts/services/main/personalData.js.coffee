angular.module('Demo12').factory('personalData', ['$http', ($http) ->

  personalData =
    data:
      personals: [{name: 'Loading', age: '' ,address: '' , phone_number: ''}]
    isLoaded: false


  personalData.createPersonal = (newPersonal) ->
    # Client-side data validation
    if newPersonal.newPersonalName == '' or newPersonal.newPersonalAge == '' 
      alert('Neither the Name nor the Age are allowed to be left blank.')
      return false

    # Create data object to Personal
    data =
      new_personal:
        name: newPersonal.newPersonalName
        age: newPersonal.newPersonalAge
        address: newPersonal.newPersonalAddress
        phone_number: newPersonal.newPersonalPhone

    # Do POST request to /personals.json
    $http.post('./personals.json', data).success( (data) ->

      # Add new personal to array of personals
      personalData.data.posts.push(data)
      console.log('Successfully created personal.')

    ).error( ->
      console.error('Failed to create new personal.')
    )

    return true


  personalData.loadPersonals = (deferred) ->
    if !personalData.isLoaded
      $http.get('./personals.json').success( (data) ->
        personalData.data.posts = data
        personalData.isLoaded = true
        console.log('Successfully loaded personals.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load personals.')
        if deferred
          deferred.reject('Failed to load personals.')
      )
    else
      if deferred
        deferred.resolve()
    

  return personalData

])