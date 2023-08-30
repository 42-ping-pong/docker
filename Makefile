FILE = -f ./docker-compose.yml

all :
	mkdir -p ~/data
	docker-compose $(FILE) up --build -d

clean :
	docker-compose $(FILE) down

fclean :
	docker-compose $(FILE) down -v

cache :
	@${MAKE} fclean
	docker system prune -a
	rm -rf ~/data

# 평가 시에는 필요 없는 부분입니다. 단지 테스트하기 편하기 위해 작성해두었으니 과제 제출 전 해당 명령이 남아있지는 않은 지 확인해주세요.
clone : 
	git clone git@github.com:42-ping-pong/ping_pong_front.git front/app 2> /dev/null || true
	git clone git@github.com:42-ping-pong/ping_pong_back.git  back/app 2> /dev/null || true
	cd front/app && git checkout release
	cd back/app  && git checkout develop

pull : 
	cd front/app && git pull origin release
	cd back/app && git checkout develop && git pull origin develop && git checkout release && git merge develop


re :
	@${MAKE} cache
	@${MAKE} all