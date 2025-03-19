require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource "Blogs" do
  header "Content-Type", "application/json"

  get "/blogs" do
    example "Listing blogs" do
      do_request
      expect(status).to eq(200)
    end
  end

post "/blogs" do
    parameter :blog, "Blog object" do
      parameter :title, "Blog title", scope: :blog, required: true
      parameter :content, "Blog content", scope: :blog, required: true
    end
    
    let(:blog) { { title: "Test Blog", content: "This is a test blog post" } }
    
    example "Creating a blog" do
      do_request
      expect(status).to eq(302)

      expect(Blog.last.title).to eq("Test Blog")
    end
  end
end
