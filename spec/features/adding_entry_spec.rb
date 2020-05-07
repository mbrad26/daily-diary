feature 'Adding new entry' do
  scenario 'a user can visit entries page and press Add entry button' do
    visit '/entries'
    click_button 'Add entry'

    expect(page).to have_field 'add_entry'
    expect(page).to have_button 'Submit'
  end

  scenario 'a user can add a new entry to the diary' do
    visit '/entries/new'
    fill_in :title, with: 'Entry title'
    fill_in :add_entry, with: 'Today was a good day'
    click_button 'Submit'

    expect(page).to have_content 'Entry title'
  end
end
