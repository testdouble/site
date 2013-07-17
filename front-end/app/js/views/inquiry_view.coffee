class TestDouble.Views.InquiryView extends TestDouble.Views.FormView
  template: JST["app/templates/inquiry.us"]

  categories: [
    "build an application",
    "receive training",
    "talk with you",
    "pair with you"
  ]

  events: ->
    _.extend {}, super,
      "submit *": "save"
      'change :input[name="category"]': "showSelectedCategory"
      'change :input': 'propogateChangesToModel'

  initialize: ->
    _.bindAll @
    @model.bind "sync", @afterSending

  render: ->
    $(@el).html(@template({model: @model, view: @})).fadeIn(500)
    super
    @showSelectedCategory()
    @

  save: (e) ->
    @model.set fullInquiryText: @printForm(@$('form'))
    @$('.send').attr('disabled','disabled').val('contacting...')
    super e

  afterSending: =>
    @$('.send').addClass('success').val('thank you!')
    _.delay =>
      window.router.navigate('reset', true)
    , 3000

  #private

  showSelectedCategory: ->
    selectedClass = @$(':input[name="category"] :selected').attr('class')
    window.router.navigate('inquiry/' + selectedClass)
    @$('.category').each (i,el) -> $(el).toggleClass('hidden',!$(el).hasClass(selectedClass))

