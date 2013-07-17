describe "TestDouble.Routers.SiteRouter", ->
  Given -> @subject = new TestDouble.Routers.SiteRouter
  Then -> expect(@subject.routes).toEqual
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    "reset": "reset"
    ".*": "inquiry"

  describe "#inquiry", ->
    Given -> @inquiryView = fakeBone(TestDouble.Views,"InquiryView",['render'])
    Given -> @inquiryModel = fakeBone(TestDouble.Models,"Inquiry")
    When -> @subject.inquiry('foo-bar-baz')
    Then ->
      args = @inquiryView.constructor.mostRecentCall.args[0]
      expect(args.el).toEqual($('#contactUs.modal.hidden')[0])
      expect(args.model).toBeAnInstanceOf(TestDouble.Models.Inquiry)
    Then -> expect(@inquiryModel.constructor).toHaveBeenCalledWith category: 'foo bar baz'
    Then -> expect(@inquiryView.render).toHaveBeenCalled()

    context "memoizing subsequent calls", ->
      When -> @subject.inquiry()
      Then -> @inquiryView.constructor.callCount == 1
      Then -> @inquiryView.render.callCount == 2
