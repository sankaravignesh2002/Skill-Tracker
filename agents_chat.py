# filename: agents_chat.py
import chainlit as cl
import asyncio
import random
from datetime import datetime

# -------------------- Agent Classes --------------------
class Buyer:
    def __init__(self, agent_id):
        self.id = agent_id

    def my_msg(self):
        return f"🟢 Buyer Agent {self.id}: My time: {datetime.now().strftime('%H:%M:%S')}"


class Seller:
    def __init__(self, agent_id):
        self.id = agent_id

    def my_msg(self):
        return f"🔵 Seller Agent {self.id}: My time: {datetime.now().strftime('%H:%M:%S')}"

# -------------------- Async Agent Functions --------------------
async def buyer_agents():
    for buyer_id in range(5):
        buyer = Buyer(buyer_id)
        msg = buyer.my_msg()
        await cl.Message(content=msg).send()
        await asyncio.sleep(random.uniform(1, 2))  # Simulate delay


async def seller_agents():
    for seller_id in range(5):
        seller = Seller(seller_id)
        msg = seller.my_msg()
        await cl.Message(content=msg).send()
        await asyncio.sleep(random.uniform(1, 2))  # Simulate delay

# -------------------- Chainlit Entry Point --------------------
@cl.on_chat_start
async def start():
    await cl.Message(content="🤖 Starting Buyer & Seller Agents...").send()

    # Run both concurrently using asyncio.gather
    await asyncio.gather(buyer_agents(), seller_agents())

    await cl.Message(content="✅ All agents finished sending messages!").send()
