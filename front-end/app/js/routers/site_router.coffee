class TestDouble.Routers.SiteRouter extends Backbone.Router
  routes:
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    "reset": "reset"
    ".*": "inquiry"

  inquiry: (category = "") ->
    @inquiryView ||= new TestDouble.Views.InquiryView
      el: $('<div></div>').appendTo('.contact-us-wrapper')[0]
      model: new TestDouble.Models.Inquiry(category: category.replace(/\-/g,' '))
    @inquiryView.render()

  reset: ->
    @inquiryView?.remove()
    @inquiryView = null
    window.router.navigate('inquiry', true)
