require 'sinatra'
require 'sinatra/reloader'
require 'csv'

get '/' do
    erb :users
end

get '/board/:id' do
    @id =params[:id]
    erb :board
end

get '/new' do
    erb :new
end


post '/board/create' do
    # 사용자가 입력한 정보를 받아서
    # CSV파일 가장 마지막에 등록
    # => 이 글의 글번호도 같이 저장해야 함
    # => 기존의 글 개수를 파악해서 
    # => 글 개수 + 1 해서 저장
    title = params[:title]
    contents = params[:contents]
    puts title
    puts contents
    id = CSV.read('./boards.csv').count + 1
    puts id
    CSV.open('./boards.csv','a+') do |row|
        row << [id,title,contents]
    end
    
    redirect "/boards/#{id}"
end

get '/boards' do
    #파일을 열고
    #각 줄마다 순회하면서
    #@가 붙어있는 변수에 넣어줌
    @boards = []
    
    CSV.open('./boards.csv','r+').each do |row|
        @boards << row
    end
    
    erb :boards
end


get '/board/:id' do
    # CSV파일에서 params[:id]로 넘어온 변수와
    # 같은 글번호를 가진 ROW를 선택
    # => CSV파일을 전체 순회
    # => 순회하다가 첫번재 COLUMN이 id와 같은 
    # => 값을 만나면 순회를 정지하고 값을
    # => 변수에다가 담아준다.
    @board = []
    CSV.read('./boards.csv').each do |row|
         if row[0].eql?params[:id]
            @board = row
            break
         end
    end

    erb :board
end

#사용자 등록

get '/user/new' do
    erb :new_user
end


post '/users/create' do
    #id,password,password_confirmation
    #password,password_confirmation이 다르면 회원등록x
    id = params[:id]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    
    puts id,password,password_confirmation
    
    check_id = []
    CSV.read('./User.csv','r+').each do |row|
        if row[0].eql?id
            check_id = id
            break
        end
    end
    puts "로오오오오오우"
    puts check_id
    #비밀번호 체크
    if password != password_confirmation
       @msg = "비밀번호가 일치하지 않습니다."
       erb :error
    #id 체크

  
    elsif check_id.eql?id
        puts "ERROR파일로 넘어갑니다."
        @msg = "이미 존재하는 ID입니다"
        erb :error
    else
        CSV.open('./User.csv','a+') do |row|
            row << [id,password]
        end
        redirect "user/#{id}"
    end
end

get '/users' do
    @users = []
    CSV.open('./User.csv','r+').each do |row|
        @users << row
    end
    erb :users
end

get '/user/:id' do
    @user =[]
    CSV.read('./User.csv').each do |row|
        if row[0].eql?params[:id]
            @user=row
            break
        end
    end
    erb :user
end
