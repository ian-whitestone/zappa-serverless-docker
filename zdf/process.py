from datetime import datetime

def run_process():
    now_str = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(f"The current time is {now_str}")