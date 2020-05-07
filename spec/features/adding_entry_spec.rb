# As a user
# So that I can keep a daily diary
# I want to be able to add a new Diary Entry
feature 'Adding new entry' do
  scenario 'a user can visit entries pages and press Add entry' do
    visit '/entries'
    click_button 'Add entry'

    expect(page).to have_field 'add_entry'
    expect(page).to have_button 'Submit'
  end

end
