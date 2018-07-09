from django.contrib.auth.models import AbstractUser
from django.db import models

# 1. members.models.User클래스 설정
# 2. INSTALLED_APPS에 members추가
# 3. AUTH_USER_MODEL설정
# 4. pipenv install pillow
# 5. db.sqlite3지우고 makemigrations -> migrate
# 6. createsuperuser
# 7. runserver에서 admin페이지 들어가지는지 확인
# 8. members.admin에 UserAdmin작성
# 9. admin에서 User관리자페이지 들어가서 img_profile필드에 파일 추가하기
# 10. 9번에서 추가해도 안 나올테니 MEDIA_ROOT및 MEDIA_URL설정하기
# 11. runserver에서 MEDIA_URL이 MEDIA_ROOT를 참조하게 하기 위해서 config.urls에 static()함수 결과 추가
#  -> MEDIA_ROOT는 'ec2-deploy/.media'폴더를 쓰도록 설정
#  -> .gitignore에 해당 폴더 추가
# 12. runserver에서 업로드한 img_profile이 잘 나오는지 확인


# 13. docker run으로 켜면 안나오는데 location /media/부분을 새로 설정 (pipenv바뀌었으니 build도)


class User(AbstractUser):
    img_profile = models.ImageField(upload_to='user', blank=True)

    def __str__(self):
        return self.username
