RSpec.describe Comedian do
  describe 'When a user visits / ' do

    it 'They should see a welcoming dashboard' do
      visit '/'

      expect(page).to have_content('Welcome!')
    end

    it 'They should see links to /comedians' do
      visit '/'

      have_link 'All Comedians!', href: '/comedians'
    end

    it 'They should see a navbar/header containing relevant links' do
      visit '/'

      within('header') do
        have_link 'Comedians', href: '/comedians'
        have_link 'Home', href: '/'
        have_link "Tim's Comedians", href: '/'
        have_link 'Add Comedian', href: '/comedians/new'
      end
    end

  end

  describe 'When a user visits /comedians' do
    describe 'They should see a list of comedians that' do

      before(:each) do
        @comedian_1 = Comedian.create(
          name:"Tom Segura", age:39,
          city: "Los Angeles", image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiMj4CQvYPfAhWOw4MKHbYCAtMQjRx6BAgBEAU&url=https%3A%2F%2Fwww.abqjournal.com%2F1084324%2Ftom-segura-sees-himself-as-a-comedy-reporter.html&psig=AOvVaw3wQtirkdVyiUN82Ll7J238&ust=1543920202352021"
        )
        @special_1a = @comedian_1.specials.create(
          name:"Mostly Stories", length:60,
          image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwja1MalvYPfAhVJ6oMKHQTbBUoQjRx6BAgBEAU&url=https%3A%2F%2Fwww.imdb.com%2Ftitle%2Ftt4970632%2F&psig=AOvVaw0b6ZC7N-V20ToadoeXL3Oq&ust=1543920237659133"
        )
        @special_1b = @comedian_1.specials.create(
          name:"Disgraceful", length:60,
          image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjwyKmyvYPfAhXk5YMKHYQmBRoQjRx6BAgBEAU&url=http%3A%2F%2Fthecomicscomic.com%2F2018%2F01%2F12%2Freview-tom-segura-disgraceful-on-netflix%2F&psig=AOvVaw2OFKieBXxN9oI0cflzbYHM&ust=1543920283307747"
        )
        @special_1c = @comedian_1.specials.create(
          name:"Completely Normal", length:60,
          image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiF_bPVvYPfAhWB7oMKHV8BBPsQjRx6BAgBEAU&url=http%3A%2F%2Fwww.peacemakerentertainment.com%2Frants%2F2014%2F7%2F31%2Fcomedy-bit-of-the-week-tom-segura-the-first-48&psig=AOvVaw025iewBl2zS_XHHPR8yIxJ&ust=1543920328398426"

        @comedian_2 = Comedian.create(
          name:"Kevin Hart", age:39,
          city: "Philadelphia", image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjA6KyAvoPfAhUIqoMKHe-BDpYQjRx6BAgBEAU&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FKevin_Hart&psig=AOvVaw2SwS5d0cSJiss-8LedriT1&ust=1543920443606773")

        @special_2a = @comedian_8.specials.create(
          name:'Seriously Funny', length:60,
          image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwip0MGZvoPfAhXtq4MKHf1bBSsQjRx6BAgBEAU&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F140174607125638549%2F&psig=AOvVaw1eewWjNHOuEgVbG2Kai5zt&ust=1543920482292462"
        )
        @special_2b = @comedian_8.specials.create(
          name:'Laugh at My Pain', length:60,
          image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiGm9atvoPfAhVixYMKHfSVB9MQjRx6BAgBEAU&url=https%3A%2F%2Fgenius.com%2Falbums%2FKevin-hart%2FKevin-hart-laugh-at-my-pain&psig=AOvVaw0JIhs9BDDPsm11jJaZwTgO&ust=1543920540072269"
        )
        @special_2c = @comedian_8.specials.create(
          name:'Let Me Explain', length:60,
          image_url:"https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjiuYLFvoPfAhXSrIMKHcuwB4cQjRx6BAgBEAU&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FKevin_Hart%3A_Let_Me_Explain&psig=AOvVaw32XNki5REYcCQKQukvGN5x&ust=1543920589139239"
        )
      end

      it 'should have a name, age and city displayed' do
        visit '/comedians'

        within("#comedian-#{@comedian_1.id}") do
          expect(page).to have_content(@comedian_1.name)
          expect(page).to have_content(@comedian_1.age)
          expect(page).to have_content(@comedian_1.city)
        end
      end

      it "should have a list of their specials' names" do
        visit '/comedians'

        within("#comedian-#{@comedian_1.id}") do
          within('.specials') do
            expect(page).to have_content(@special_1a.name)
            expect(page).to have_content(@special_1b.name)
            expect(page).to have_content(@special_1c.name)
          end
        end
      end

      it "should have their specials' lengths displayed" do
        visit '/comedians'

        within("#comedian-#{@comedian_1.id}") do
          expect(page).to have_content("Length: #{@special_1a.length} min")
          expect(page).to have_content("Length: #{@special_1b.length} min")
          expect(page).to have_content("Length: #{@special_1c.length} min")

          expect(page).to have_css("img[src='#{@special_1a.image_url}']")
          expect(page).to have_css("img[src='#{@special_1b.image_url}']")
          expect(page).to have_css("img[src='#{@special_1c.image_url}']")
        end
      end

      describe 'When a user searches by age ex: /comedians?age=45 ' do
        describe 'They should see the comedian index with' do

          it 'Should see comedians of the age searched' do
            visit '/comedians?age=45'

            expect(page).to have_content(@comedian_8.name)
          end

          it "Should not see any of the comedians who aren't that age" do
            visit '/comedians?age=45'

            expect(page).to have_no_content(@comedian_1.name)
          end

        end
      end

    end
  end
end
