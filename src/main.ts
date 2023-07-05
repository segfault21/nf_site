/* eslint-disable no-console */
import { NestFactory, Reflector } from '@nestjs/core';
import { AppModule } from './app.module';
import {
  ClassSerializerInterceptor,
  ConsoleLogger,
  ValidationPipe,
} from '@nestjs/common';
import { WsAdapter } from '@nestjs/platform-ws';
import * as bodyParser from 'body-parser';
//import { scheduleTasks } from './task-scheduler'

const path = require('path');
const dotenv = require('dotenv');
const compression = require('compression');

dotenv.config({
  override: true,
  path: path.resolve(
    __dirname,
    '..',
    process.env.NODE_ENV === 'test' ? '.env.test' : '.env',
  ),
});

export async function buildApp(log = true) {
  const app = await NestFactory.create(AppModule, {
    cors: true,
    logger:
      process.env.NODE_ENV === 'test' || !log
        ? ['warn', 'error']
        : new ConsoleLogger(),
  });
  app.useGlobalPipes(new ValidationPipe({ skipMissingProperties: true }));
  app.useGlobalInterceptors(new ClassSerializerInterceptor(app.get(Reflector)));
  //app.useGlobalGuards(new AclGuard(app.get(Reflector), app.get(UsersService)))
  app.useWebSocketAdapter(new WsAdapter(app));
  app.use(compression());
  app.use(bodyParser.json({ limit: '50mb' }));
  app.use(bodyParser.text({ limit: '50mb' }));
  app.use(
    bodyParser.urlencoded({
      limit: '50mb',
      extended: true,
      parameterLimit: 50000,
    }),
  );
  return app;
}

async function bootstrap() {
  const app = await buildApp();
  await app.listen(process.env.PORT ? Number(process.env.PORT) : 3000);
  //if (process.env.NODE_ENV !== 'development') await scheduleTasks(app)
}

if (require.main === module) {
  console.log('Starting');
  bootstrap().catch(console.error);
}
