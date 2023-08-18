FILE = -f ./docker-compose.yml

all :
	mkdir -p ~/data
	docker-compose $(FILE) up --build -d

clean :
	docker-compose $(FILE) down

fclean :
	docker-compose $(FILE) down -v

cache :
	@${MAKE} clean
	docker system prune -a
	rm -rf ~/data

# 평가 시에는 필요 없는 부분입니다. 단지 테스트하기 편하기 위해 작성해두었으니 과제 제출 전 해당 명령이 남아있지는 않은 지 확인해주세요.
clone : 
	git clone git@github.com:42-ping-ping/ping_pong_front front/app
	git clone git@github.com:42-ping-ping/ping_pong_back  back/app

re :
	@${MAKE} fclean
	@${MAKE} all