Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :quiz_qestions

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/quizzes/validate', to: "quizzes#validate", as: "quizzes_validate"

  get 'quizzes/html', to: "quizzes#html", as: "quizzes_html"
  get 'quizzes/css', to: "quizzes#css", as: "quizzes_css"
  get 'quizzes/ruby', to: "quizzes#ruby", as: "quizzes_ruby"
  get 'quizzes/javascript', to: "quizzes#javascript", as: "quizzes_javascript"
 
  get'quizzes/cards', to: "quizzes#cards", as: "cards"
  get '/quiz_questions/:subject/:difficulty', to: 'quiz_questions#index', as: "quiz_settings"

  root 'splash_page#splash_page'
  
  resources :questions
  resources :profiles
  resources :quizzes
  resources :quiz_questions
  resources :user_questions

  post '/quiz_questions/validate', to: 'quiz_questions#validate', as: 'quiz_validate'

  root 'splash_page#splash_page'

  get'/quiz_questions/html_easy', to: "quiz_questions#html_easy", as: "html_easy"

end
