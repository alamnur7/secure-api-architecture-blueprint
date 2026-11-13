import os


def run_ping(user_input):
    # RENTAN: Langsung menggabungkan input pengguna ke dalam perintah sistem (Command Injection)
    os.system("ping " + user_input)