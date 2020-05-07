feature 'Visiting homepage' do
  scenario 'I can see a greeting' do
    visit '/'

    expect(page).to have_content 'Hello World!'
  end
end
