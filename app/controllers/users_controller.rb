class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Sergei',
        username: 'SkiZ',
        avatar_url: 'https://99px.ru/sstorage/1/2020/10/image_12010201411197140419.gif'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Sergei',
      username: 'SkiZ',
      avatar_url: 'https://99px.ru/sstorage/1/2020/10/image_12010201411197140419.gif'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('25.02.2021')),
      Question.new(text: 'Как дальше жить?', created_at: Date.parse('25.02.2021'))
    ]

    @questions_count = @questions.count
    @new_question = Question.new
  end
end
