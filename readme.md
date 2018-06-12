##	Day 4



#### 오늘 할 내용

* CRUD 중에서 CR.
* 자료가 저장되는 곳은 DB가 아니라 CSV파일로 저장.
* 그리고 사용자의 입력을 받아서 간이 게시판을 만든다.

#### 스스로 과제

* 사용자의 입력을 받는 `form ` 태그로 이루어진 `/new` 액션과 `erb` 파일
  * `form`의 `action`속성은 `/create`로 가도록 합니다.
  * `method`는 `post`를 이용합니다.
  * 게시판 글의 제목과 본문 두가지 속성을 저장.
* 전체 목록을 보여주는 `table`태그로 이루어진 `/boards` 액션과 `erb`파일
  * 일단 파일만 생성.
* `/create`액션을 만들고 작성 후에는 `/boards` 액션으로 돌아가게 구성 
  * (수정)`/create`액션이 동작한 이후에는 본인이 작성한 글로 이동하게 함.
* 각 글(1개의 글을 보는 페이지)을 볼 수 있는 페이지는 `/board/글번호`의 형태로 작성.

### Create와 Read

1. /new
2. /create
3. /boards
4. /board/:id

* `board`라고 하는 게시판이 하나만 존재하고 있다
* `user` 라고 하는 CRUD기능을 해야하는 DB Table을 만든다고 가정하면?
* 새로운 유저를 등록한다면?

### 스스로 과제

* `User`를 등록할 수 있는 CSV파일 만들기
* id, password,password_confirmation
* 조건 1
  * password와 password_confirmation을 받는데 회원을 등록할 때 이 두 문자열이 다르면 회원등록 x
* Route(라우팅)
  * `get` /user/new		=> new_user.erb
  * `post`/user/create    
  * `get`/users                    => users.erb
  * `get`/user/:id                => user.erb





