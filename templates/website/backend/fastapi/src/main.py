from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def index():
	return {"message": "Put Your Application Here!"}
