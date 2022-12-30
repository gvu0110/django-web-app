# django-web-app

### Deploy Django app
Set up virtual environment
```sh
$ virtualenv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
```

Launch Postgres with pre-created `django` database
```sh
$ docker compose up
```

Run Django migrations
```sh
$ cd web_app
$ python manage.py migrate
```

Add sample data
```
$ python manage.py shell
```
- Add questions
```python
>>> from polls.models import Choice, Question  
>>> Question.objects.all()
<QuerySet []>

# Create a new Question.
>>> from django.utils import timezone
>>> q = Question(question_text="What's up?", pub_date=timezone.now())

# Save the object into the database. You have to call save() explicitly.
>>> q.save()
>>> q.id
1
```
- Add choices
```python
>>> q = Question.objects.get(pk=1)

# Display any choices from the related object set -- none so far.
>>> q.choice_set.all()
<QuerySet []>

# Create choices.
>>> q.choice_set.create(choice_text='Not much', votes=0)
<Choice: Not much>
>>> q.choice_set.create(choice_text='The sky', votes=0)
<Choice: The sky>
>>> q.choice_set.all()
<QuerySet [<Choice: Not much>, <Choice: The sky>]>
```

Run the web app and access at http://localhost:8000/polls
```sh
$ python manage.py runserver
```

Create an admin user
```sh
$ python manage.py createsuperuser

Username: admin
Email address: admin@example.com
Password: **********
Password (again): *********
Superuser created successfully.
```

Access admin portal at http://localhost:8000/admin

### Run unit tests
```sh
$ cd web_app
$ python manage.py test polls
```
