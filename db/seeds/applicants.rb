User.find(:all).each do |user|
  if user.plugins.find_by_name('applicants').nil?
    user.plugins.create(:name => 'applicants',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

apply_page = Page.create(
  :title => 'Apply',
  :link_url => '/apply',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/(applicants|apply).*$'
)
apply_page.parts.create(
  :title => 'Body',
  :body => "Please fill out the following form to apply to the next program:",
  :position => 0
)

thank_you_page = apply_page.children.create(
  :title => 'Thank You',
  :link_url => '/apply/thank-you',
  :menu_match => "^/(applicants/apply)/thank-you",
  :show_in_menu => false,
  :deletable => false,
  :position => 0
)
thank_you_page.parts.create(
  :title => 'Body',
  :body => "<p>Thanks for applying. We'll review your application and get back to you with any questions.</p>",
  :position => 0
)
