class TestDouble.Models.Inquiry extends Backbone.Model
  url: -> "/inquiries/#{@escape('id')}"
  toJSON: -> {'inquiry': super}

  ready: =>
    _(["name", "phone", "email"]).any (a) => @get(a)