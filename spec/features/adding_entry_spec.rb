# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry
feature 'Adding new entry' do
  scenario 'a user can visit entries page and press Add entry button' do
    visit '/entries'
    click_button 'Add entry'

    expect(page).to have_field 'add_entry'
    expect(page).to have_button 'Submit'
  end

  scenario 'a user can add a new entry to the diary' do
    visit '/entries/new'
    fill_in :add_entry, with: 'Today was a good day'
    click_button 'Submit'

    expect(page).to have_content 'Today was a good day'
  end
end
