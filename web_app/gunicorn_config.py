bind = '0.0.0.0:8000'

preload = True
workers = 1
worker_class = 'gevent'

# > This setting [threads] only affects the gthread worker type.
# > Note: If you try to use the sync worker type and set the threads
# > setting to more than 1, the gthread worker type will be used instead.
# threads = 1

capture_output = True
enable_stdio_inheritance = True

accesslog = '-'
access_log_format = '{ \
"log_schema": "webaccess_clf", \
"clf_remote_ip": "%(h)s", \
"clf_client_id": "%(l)s", \
"clf_user_name": "%(u)s", \
"clf_access_time": "%(t)s", \
"clf_request": "%(r)s", \
"clf_resp_status": "%(s)s", \
"clf_resp_bytes": "%(b)s", \
"clf_referrer": "%(f)s", \
"clf_agent": "%(a)s", \
"clf_elapsed_secs": "%(L)s", \
"clf_elapsed_micros": "%(D)s" \
}'
