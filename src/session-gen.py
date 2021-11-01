# Inbuilt
import asyncio
import os
import sys
import platform

# Site-Packages
from telethon import TelegramClient
from telethon.sessions import StringSession
from telethon.errors.rpcerrorlist import ApiIdInvalidError, PhoneNumberInvalidError

async def main():
    try:
        async with TelegramClient(
            StringSession(),
            int(input('Your Telegram ApiId - ')),
            input('Your Telegram ApiHash - ')
        ) as temp_client:
            print("Generating a user session for Ultroid...")
            await temp_client.send_message(
                "me",
                f"**This Is Your Session String**\n\n`{temp_client.session.save()}`\n\n**Do Not Leak This !**",
            )
            print("Your SESSION has been generated. Check your telegram saved messages!")
            sys.exit(0)
    except ApiIdInvalidError:
        print("Your Api Id/Hash combination is invalid. Kindly recheck.\nQuitting...")
        sys.exit(0)
    except ValueError:
        print("ApiHash must not be empty!\nQuitting...")
        sys.exit(0)
    except PhoneNumberInvalidError:
        print("The phone number is invalid!\nQuitting...")
        sys.exit(0)
    except KeyboardInterrupt:
        os.system('cls' if platform.system() == 'Windows' else 'clear')
        sys.exit(0)


if __name__ == '__main__':
    asyncio.run(main())