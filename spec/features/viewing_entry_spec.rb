feature 'Viewing entries' do
  scenario 'a user can see a list of previous entries' do
    today = Entries.create(body: 'Today was a great day for coding', title: 'Today entry')
    yesterday = Entries.create(body: 'Yesterday was a usual Makers day', title: 'Yesterday entry')

    visit '/entries'

    expect(page).to have_link('Today entry')
    expect(page).to have_link('Yesterday entry')
  end

  scenario 'a user can click on a title and see the full entry' do
    today = Entries.create(body: 'Today was a great day for coding', title: 'Today entry')

    visit '/entries'
    click_link 'Today entry'

    expect(current_path).to eq "/entries/#{today.id}"
    expect(page).to have_content "#{today.body}"

    click_button 'Back to Index'

    expect(current_path).to eq '/entries'
  end
end
