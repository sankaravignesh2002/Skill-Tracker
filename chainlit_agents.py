"""
Chainlit demo: 10 Buyer agents and 5 Seller agents simulated conversation

How to run:
1. pip install chainlit
2. chainlit run chainlit_agents.py

This script creates simple Agent objects (Buyer/Seller) and simulates a short negotiation
conversation between them. No LLM is used — it's a deterministic/random simulator.
"""

import asyncio
import random
import chainlit as cl

# Configuration
NUM_BUYERS = 10
NUM_SELLERS = 5
ROUNDS_PER_BUYER = 3
DELAY_BETWEEN_MESSAGES = 0.6  # seconds

random.seed(42)

class Buyer:
    def __init__(self, id, name, desired_item, desired_qty, max_price_per_unit):
        self.id = id
        self.name = name
        self.desired_item = desired_item
        self.desired_qty = desired_qty
        self.max_price_per_unit = max_price_per_unit

    def propose(self):
        return {
            "item": self.desired_item,
            "qty": self.desired_qty,
            "max_price": self.max_price_per_unit,
        }


class Seller:
    def __init__(self, id, name, item, available_qty, price_per_unit):
        self.id = id
        self.name = name
        self.item = item
        self.available_qty = available_qty
        self.price_per_unit = price_per_unit

    def quote(self, qty):
        offered_qty = min(qty, self.available_qty)
        return {"item": self.item, "qty": offered_qty, "price": self.price_per_unit}

    def sell(self, qty):
        sold = min(qty, self.available_qty)
        self.available_qty -= sold
        return sold


def make_buyers(n):
    buyers = []
    for i in range(1, n + 1):
        buyers.append(
            Buyer(
                id=i,
                name=f"Buyer{i}",
                desired_item="apple",
                desired_qty=random.randint(1, 5),
                max_price_per_unit=round(random.uniform(1.0, 4.0), 2),
            )
        )
    return buyers


def make_sellers(n):
    sellers = []
    for i in range(1, n + 1):
        sellers.append(
            Seller(
                id=i,
                name=f"Seller{i}",
                item="apple",
                available_qty=random.randint(3, 12),
                price_per_unit=round(random.uniform(1.0, 5.0), 2),
            )
        )
    return sellers


async def simulate_conversation(buyers, sellers):
    """Simulate simple negotiation: each buyer in turn contacts a random seller and tries to buy."""

    await cl.Message(content="Starting simulated marketplace conversation...").send()

    for buyer in buyers:
        for r in range(ROUNDS_PER_BUYER):
            seller = random.choice(sellers)

            # Buyer message: propose
            prop = buyer.propose()
            b_msg = f"{buyer.name}: Hi {seller.name}, I want {prop['qty']} {prop['item']}(s). Max price {prop['max_price']}/unit."
            await cl.Message(content=b_msg, author=buyer.name).send()
            await asyncio.sleep(DELAY_BETWEEN_MESSAGES)

            # Seller replies with quote
            quote = seller.quote(prop['qty'])
            s_msg = f"{seller.name}: I can offer {quote['qty']} {quote['item']}(s) at {quote['price']}/unit (available {seller.available_qty})."
            await cl.Message(content=s_msg, author=seller.name).send()
            await asyncio.sleep(DELAY_BETWEEN_MESSAGES)

            # Buyer decision
            if quote['price'] <= prop['max_price'] and quote['qty'] > 0:
                sold_qty = seller.sell(quote['qty'])
                trans_msg = f"{buyer.name}: Deal — buying {sold_qty} at {quote['price']}/unit. Thank you!"
                await cl.Message(content=trans_msg, author=buyer.name).send()
            elif quote['qty'] == 0:
                trans_msg = f"{buyer.name}: Oh no — {seller.name} has no stock left."
                await cl.Message(content=trans_msg, author=buyer.name).send()
            else:
                counter_price = round((quote['price'] + prop['max_price']) / 2, 2)
                cnt_msg = f"{buyer.name}: That's too expensive. Can you do {counter_price}/unit?"
                await cl.Message(content=cnt_msg, author=buyer.name).send()
                await asyncio.sleep(DELAY_BETWEEN_MESSAGES)

                if counter_price >= seller.price_per_unit and seller.available_qty > 0:
                    sold_qty = seller.sell(min(prop['qty'], seller.available_qty))
                    agree_msg = f"{seller.name}: Okay, I accept {counter_price}/unit for {sold_qty}."
                    await cl.Message(content=agree_msg, author=seller.name).send()
                    await asyncio.sleep(DELAY_BETWEEN_MESSAGES)
                    conclude_msg = f"{buyer.name}: Bought {sold_qty} at {counter_price}/unit."
                    await cl.Message(content=conclude_msg, author=buyer.name).send()
                else:
                    refuse_msg = f"{seller.name}: Sorry, I can't go that low."
                    await cl.Message(content=refuse_msg, author=seller.name).send()
                    await asyncio.sleep(DELAY_BETWEEN_MESSAGES)
                    final_msg = f"{buyer.name}: Okay, I'll look elsewhere."
                    await cl.Message(content=final_msg, author=buyer.name).send()

            await asyncio.sleep(DELAY_BETWEEN_MESSAGES)

    await cl.Message(content="\nSimulation finished. Sellers' remaining stocks:").send()
    for s in sellers:
        await cl.Message(content=f"{s.name}: {s.available_qty} {s.item}(s) left", author=s.name).send()


@cl.on_chat_start
async def main():
    buyers = make_buyers(NUM_BUYERS)
    sellers = make_sellers(NUM_SELLERS)

    header = "Initial marketplace state:\n"
    await cl.Message(content=header).send()
    for b in buyers:
        await cl.Message(content=f"{b.name}: wants {b.desired_qty} {b.desired_item}(s) up to {b.max_price_per_unit}/unit", author=b.name).send()
    for s in sellers:
        await cl.Message(content=f"{s.name}: has {s.available_qty} {s.item}(s) at {s.price_per_unit}/unit", author=s.name).send()

    await asyncio.sleep(1)
    await simulate_conversation(buyers, sellers)


if __name__ == "__main__":
    print("This file is a Chainlit app. Run it with: chainlit run chainlit_agents.py")
