from typing import Optional
from fastapi import FastAPI
from fastapi.logger import logger
from pydantic import BaseModel

class LoginBody(BaseModel):
    username: str
    password: str

class User(BaseModel):
    name: str
    userid: str
    email: str
    access: str
    avatar: Optional[str] = None

class LoginResponse(BaseModel):
    data: User
    status: str

current_user: User = User(
    name="demo",
    userid="demo_id",
    email="demo@dell.com",
    access="admin",
)

app = FastAPI()

@app.get("/api/currentUser")
async def get_current_user() -> LoginResponse:
    return LoginResponse(data=current_user, status="ok")

@app.post("/api/login/account")
async def login_account(login_body: LoginBody) -> LoginResponse:
    logger.info(f"received login from {login_body.username}")
    return LoginResponse(data=current_user, status="ok")
