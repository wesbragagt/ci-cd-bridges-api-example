import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const port = process.env.PORT ? Number(process.env.PORT) : 3002;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(port);
}

bootstrap();

// test hook 1
