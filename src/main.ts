import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as path from 'path'
import * as dotenv from 'dotenv';


dotenv.config({
  override: true,
  path: path.resolve(__dirname, '..', '.env'),
})
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(process.env.PORT);
}
bootstrap();
