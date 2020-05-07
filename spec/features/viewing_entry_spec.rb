feature 'Viewing entries' do
  scenario 'a user can see a list of previous entries' do
    today = Entries.create(body: 'Today was a great day for coding', title: 'Today entry')
    yesterday = Entries.create(body: 'Yesterday was a usual Makers day', title: 'Yesterday entry')

    visit '/entries'

    expect(page).to have_link('Today entry', href: '/entries/today.id')
    expect(page).to have_link('Yesterday entry', href: '/entries/yesterday.id')
  end
end
